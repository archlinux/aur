# Maintainer: aksr <aksr at t-com dot me>
pkgname=notmuchfs-git
pkgver=0.3.r23.f7ed316
pkgrel=1
pkgdesc="A virtual maildir file system for notmuch queries."
arch=('i686' 'x86_64')
url="https://github.com/tsto/notmuchfs"
license=('GPLv3')
groups=()
depends=('notmuch>=0.20' 'fuse2>=2.6')
makedepends=('git')
optdepends=('mutt')
provides=("notmuchfs=${pkgver}")
conflicts=('notmuchfs')
replaces=()
backup=()
options=()
install=notmuchfs-git.install
source=("$pkgname::git+https://github.com/tsto/notmuchfs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(cat version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 notmuchfs $pkgdir/usr/bin/notmuchfs
  install -Dm755 mutt/bin/notmuch_tag $pkgdir/usr/bin/notmuch_tag
  install -Dm755 mutt/bin/prompt_mkdir $pkgdir/usr/bin/prompt_mkdir
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 README.MUTT.md $pkgdir/usr/share/doc/${pkgname%-*}/README.MUTT.md
  install -Dm644 ISSUES $pkgdir/usr/share/doc/${pkgname%-*}/ISSUES
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
  install -Dm644 COPYING-GPL-3  $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

