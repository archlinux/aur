# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgdesc='Concrnt is a next-gen decentralized social network platform designed to make your world richer.'
pkgname=('concrnt-api-bin')
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')

depends=('concrnt-shared-config'
         'concrnt-gateway'
         'redis'
         'memcached'
         'postgresql')

provides=('concrnt-api')
conflicts=('concrnt-api')

options=('!strip' '!debug')

source=("concrnt-api.hook"
        "concrnt-api.service"
        # v1.6.0 tag does not yet contain LICENSE file
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE")

source_x86_64=("ccapi-x86_64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/api-linux-amd64")
source_aarch64=("ccapi-aarch64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/api-linux-arm64")

sha512sums=('0f83358662903db925f928190f0f7938ba1b95cd87595830e9d7963f539de56955b73866d74e896786c5e2311b23678fa3e6451c5890e754496882997ce1b376'
            '021f23907fa2ad20ba1ca5458c81c79fb92a75f4a8ec72b8a30cd4752ff1336436dcb5223594cf90e6700881f23947af8e69be9242bc21bc095fa6dababe707c'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')
sha512sums_x86_64=('d40dfb5b9181cc530204d6626f2f450a841fb3da686786021b0046b2487ed2c1313886e2015f9e54095cd0cc6d0d481fb7c3dae5386469888b7987c5ca80f20b')
sha512sums_aarch64=('be0dc010520fb459f4fc2460747d756d18abcb5629cba7684412545037627070d9277cb6f2893d2a8867d4a23f0959218257e8e8c62c60fd9e819dec22fd1c28')


package() {

  install -Dm755 "${srcdir}/ccapi-${arch}-${pkgver}" "${pkgdir}/usr/bin/ccapi"
  install -Dm644 "${srcdir}/concrnt-api.service" "${pkgdir}/usr/lib/systemd/system/concrnt-api.service"
  install -Dm644 "${srcdir}/concrnt-api.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-api.hook"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
