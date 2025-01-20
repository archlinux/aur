#Maintainer:	AImixAE <aimixae@outlook.com>

pkgname=kawaii-gcc-plugin-zh-cn
pkgver=0.0.3
pkgrel=1
pkgdesc='a gcc plugin and make your GCC	kawaii :)'
arch=('any')
url="https://ghproxy.cn/https://github.com/Bill-Haku/kawaii-gcc"
license=('GPL-3.0')
depends=('gcc' 'gettext' 'noto-fonts-cjk')
makedepends=('git' 'make')
optdepends=('wqy-zenhei: fonts support'
  'wqy-microhei: fonts support')
source=("${pkgname}::git+${url}")
sha256sums=(SKIP)

build() {
  cd ${srcdir}/${pkgname}
  make
}

check() {
  if [[ ! -f ${srcdir}/${pkgname}/build/zh-kawaii.mo ]]; then
    exit 1
  fi
}

package() {
  # Copy
  install -Dm644 "${srcdir}/${pkgname}/build/zh-kawaii.mo" \
    "${pkgdir}/usr/share/locale/zh_CN_kawaii/LC_MESSAGES"
}
