# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatlibc-git
pkgver=r154.e5469d2
pkgrel=1
epoch=
pkgdesc="A small ARM/x86(_64) libc."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/neatlibc.git"
license=('custom:BSD')
groups=()
depends=()
makedepends=('git' 'neatcc-git' 'fasm' 'neatas-git')
optdepends=('neatcc-git: A simple ARM/x86(_64) C compiler' 
            'neatld-git: A simple ARM/x86(_64) static linker'
            'neatas-git: A simple ARM assembler')
checkdepends=()
provides=()
conflicts=('glibc')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://repo.or.cz/neatlibc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make CC="$(which ncc)"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/include/{arpa,linux,sys}
  install -Dm644 libc.a $pkgdir/usr/lib/libc.a
  install -m644 ctype.h dirent.h elf.h errno.h fcntl.h      \
                inttypes.h poll.h regex.h setjmp.h signal.h \
                stdarg.h stddef.h stdint.h stdio.h stdlib.h \
                string.h termios.h time.h unistd.h utime.h $pkgdir/usr/include
  install -m644 arpa/inet.h $pkgdir/usr/include/arpa
  install -m644 sys/ioctl.h sys/mman.h sys/stat.h \
                sys/time.h sys/types.h sys/wait.h $pkgdir/usr/include/sys
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

