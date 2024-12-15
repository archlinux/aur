# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-gateway' 'concrnt-api')
makedepends=('pnpm')

source=("concrnt-${pkgver}::https://github.com/totegamma/concurrent/archive/refs/tags/${_pkgver}.tar.gz"
        # v1.6.0 release tarball does not yet contain LICENSE file
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE")

sha512sums=('742982dc1344449bdaf560cf6f6ea724b3d2d52dbd5031876398961f79e02718c9d4b875557f204349e39b7dca83a8716a32415b812eb68dabef70926e743d95'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412')

build() {
  cd "${srcdir}/concrnt/web"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  mkdir -p ${pkgdir}/var/lib/concrnt
  cp -dpTr --no-preserve=ownership "${srcdir}/concrnt/web/dist" "${pkgdir}/var/lib/concrnt/web"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
