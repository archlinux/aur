# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Ray Kohler <ataraxia@gmail.com>
# Contributor: muflax <muflax@gmail.com>
# Contributor: coolkehon <coolkehon@gmail.com>

pkgname=task-dev
_name=taskwarrior
pkgver=2.6.0
_ver=s2.6.0
pkgrel=1
pkgdesc="A command-line todo list manager"
arch=('i686' 'x86_64')
url="http://taskwarrior.org/"
license=('MIT')
depends=('util-linux' 'gnutls')
provides=('task')
conflicts=('task')
makedepends=('cmake')
optdepends=(
  'bash-completion: for bash completion'
  'python: for python export addon'
  'ruby: for ruby export addon'
  'perl: for perl export addon'
  'perl-json: for perl export addon'
)
source=("https://github.com/GothenburgBitFactory/${_name}/archive/${_ver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name-$_ver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_name-$_ver"
  make DESTDIR="$pkgdir" install

  # Note that we rename the bash completion script for bash-completion > 1.99, until upstream does so.
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/bash/task.sh" "$pkgdir/usr/share/bash-completion/completions/task"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/fish/task.fish" "$pkgdir/usr/share/fish/completions/task.fish"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/zsh/_task" "$pkgdir/usr/share/zsh/site-functions/_task"

  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/task.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskdata.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskedit.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskrc.vim"

  install -Dm644 "$srcdir/$_name-$_ver/LICENSE" "$pkgdir/usr/share/licenses/task/LICENSE"
}
