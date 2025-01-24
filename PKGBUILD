# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgdesc='Concrnt is a next-gen decentralized social network platform designed to make your world richer.'
pkgname=('concrnt-api-bin')
pkgver=1.6.5
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')

provides=('concrnt-api')
conflicts=('concrnt-api')

options=('!strip' '!debug')

source=("concrnt-api.hook"
        "concrnt-api.service"
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/tags/${_pkgver}/LICENSE")

source_x86_64=("ccapi-x86_64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/api-linux-amd64")
source_aarch64=("ccapi-aarch64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/api-linux-arm64")

sha512sums=('0f83358662903db925f928190f0f7938ba1b95cd87595830e9d7963f539de56955b73866d74e896786c5e2311b23678fa3e6451c5890e754496882997ce1b376'
            '919f85b34faef68dff1ee1b43fa5351b2a8bcfbb166b20d6f75336e2eaba39b03bfe85ba3a8e13051e47f9b08763937b24ee2fb5818fcd4de47b19b77095f25f'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')
sha512sums_x86_64=('cb8149f26d6791ccc5889fb5295510478a6ada60ccbb5267933a47da8256b380581297888649339da4f4aa4f78c3019a542e936dce71639754c8308adced70dd')
sha512sums_aarch64=('140c0faf2a3e1cd7e3907c532f6516c5d2d24a06ee7c7e028d1ab920f9145374976d57be7ec579105ddb3ea69515b4cdf9bad2984cd2e7fc87fe57e98b79328b')


package() {
  depends=('concrnt-shared-config'
           'concrnt-gateway'
           'redis'
           'memcached'
           'postgresql')

  install -Dm755 "${srcdir}/ccapi-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/ccapi"
  install -Dm644 "${srcdir}/concrnt-api.service" "${pkgdir}/usr/lib/systemd/system/concrnt-api.service"
  install -Dm644 "${srcdir}/concrnt-api.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-api.hook"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
