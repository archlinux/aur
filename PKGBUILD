pkgname=fmatrix-git
pkgver=1.5.0  # Ставим 1.5.0, чтобы перепрыгнуть старые ошибки
pkgrel=1
pkgdesc="Fast smooth Matrix rain written in C++"
arch=('x86_64')
url="https://github.com/ffacece/fmatrix_project"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'gcc' 'make')
provides=('fmatrix')
conflicts=('fmatrix')
source=("git+https://github.com/ffacece/fmatrix_project.git")
sha256sums=('SKIP')

pkgver() {
  cd "fmatrix_project"
  # Синхронизируем базу версии
  printf "1.5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "fmatrix_project"
  # Добавляем -lncursesw для корректной поддержки Unicode (японских символов)
  g++ -O3 fmatrix.cpp -o fmatrix -lncursesw
}

package() {
  cd "fmatrix_project"
  install -Dm755 fmatrix "${pkgdir}/usr/bin/fmatrix"
}
