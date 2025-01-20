#Maintainer:	AImixAE <aimixae@outlook.com>
#Contributor:	Giteeajake <giteeajake@qq.com>

pkgname=gcc-kawaii-plugin-zh
pkgver=0.0.3
pkgrel=1
pkgdesc='a gcc plugin and make your GCC	kawaii :)'
arch=('any')
url="https://kkgithub.com/Bill-Haku/kawaii-gcc"
license=('GPL-3.0-or-later')
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
  # Backup
  mkdir -p "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES"

  if [[ -f "/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo" ]]; then
    cp "/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo" \
      "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo.bak"
  fi

  # Copy
  install -Dm644 "${srcdir}/${pkgname}/build/zh-kawaii.mo" \
    "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo"
}
