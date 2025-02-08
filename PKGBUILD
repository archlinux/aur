# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgdesc='Concrnt is a next-gen decentralized social network platform designed to make your world richer.'
pkgname=('concrnt-api-bin')
pkgver=1.6.6
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')

provides=('concrnt-api')
conflicts=('concrnt-api')

options=('!debug')

source=("concrnt-api.hook"
        "concrnt-api.service"
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/tags/${_pkgver}/LICENSE")

source_x86_64=("ccapi-x86_64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/api-linux-amd64")
source_aarch64=("ccapi-aarch64-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/api-linux-arm64")

sha512sums=('0f83358662903db925f928190f0f7938ba1b95cd87595830e9d7963f539de56955b73866d74e896786c5e2311b23678fa3e6451c5890e754496882997ce1b376'
            '919f85b34faef68dff1ee1b43fa5351b2a8bcfbb166b20d6f75336e2eaba39b03bfe85ba3a8e13051e47f9b08763937b24ee2fb5818fcd4de47b19b77095f25f'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')
sha512sums_x86_64=('7379f687bfeb63bd0d46d77c4bc66f4c982d087e628666e9067247e299e5ba5560d356b80809c6019496a1e0e7913bcf84d867cb01f7583ac04e4a925a3bde0f')
sha512sums_aarch64=('56f4c4355f9dd3019bd667b62fdfa95ecf10171bdadafeedfe6cefc8e6609e6a3790b547772d22e9fbe0bbf36cf5f3312027ad95d501fc46fddf2eca8c7f6322')


package() {
  depends=('glibc'
           'concrnt-shared-config')
  optdepends=('concrnt-gateway: Concrnt Gateway server'
              'redis: Local cache support'
              'memcached: Local cache support'
              'postgresql: Local database support')

  install -Dm755 "${srcdir}/ccapi-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/ccapi"
  install -Dm644 "${srcdir}/concrnt-api.service" "${pkgdir}/usr/lib/systemd/system/concrnt-api.service"
  install -Dm644 "${srcdir}/concrnt-api.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-api.hook"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
