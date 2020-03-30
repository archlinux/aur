# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
pkgname=qweechat-git
pkgver=r100.235ad36
pkgrel=1
pkgdesc='Qt remote GUI for WeeChat'
url='https://weechat.org'
license=('GPL3')
arch=('any')
makedepends=('git')
depends=('python2>=2.6' 'python2-setuptools' 'pyside2' 'hicolor-icon-theme')
source=('qweechat::git://github.com/weechat/qweechat.git'
        'qweechat.desktop')
sha256sums=('SKIP'
            '90571f856968904f8839f906199e57fb30e51b8ad67c87da79eda47fe98ceb1e')

pkgver() {
  cd "qweechat"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "qweechat"

  python2 setup.py build
}

package() {
  cd "qweechat"

  python2 setup.py install --root="$pkgdir" -O2

  install -Dm0644 ../qweechat.desktop "$pkgdir/usr/share/applications/qweechat.desktop"
  install -Dm0644 qweechat/data/icons/weechat.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/qweechat.png"
}
