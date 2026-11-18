# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=tinox-ide
pkgver=0.1.1
pkgrel=1
pkgdesc="Native KDE Plasma IDE for the Tinox language, written in Tinox (built from source)"
arch=('x86_64')
url="https://github.com/subnix-work/tinox-ide"
license=('MIT' 'Apache-2.0')
depends=('qt6-base' 'kparts' 'kcoreaddons' 'ki18n' 'kcrash' 'kdbusaddons'
         'ktexteditor' 'syntax-highlighting' 'kconfig' 'kconfigwidgets'
         'kxmlgui' 'kwidgetsaddons' 'knotifications' 'gc')
# Tinox is not in Arch's repositories: tinox-bin (or tinox built from source) provides it.
makedepends=('tinox>=2.9.6' 'cmake' 'ninja' 'extra-cmake-modules' 'clang'
             'patchelf' 'pkgconf')
optdepends=('tinox>=2.9.6: build and run Tinox programs from the IDE'
            'clang: compile Tinox applications'
            'konsole: embedded interactive terminal'
            'breeze: KDE widget style'
            'ripgrep: project search')
conflicts=('tinox-ide-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/subnix-work/tinox-ide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9f94896f49a3cb88aef884edcc395233ca6101030480de0f35df3e73b3bdc5a')

build() {
  cd "$pkgname-$pkgver"
  # `tinox install` fetches the pinned tinox.core.json dependency.
  tinox install
  make ide
}

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX=/usr LIBDIR=lib DESTDIR="$pkgdir"
}
