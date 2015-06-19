# Contributor: Vojtech Kral <kral.vojtech (at) gmail.com>

pkgname=kfortune-git
pkgver=r39.0217400
pkgrel=1
pkgdesc="kernel-space remake of the popular fortune program"
arch=('i686' 'x86_64')
url="https://github.com/vojtechkral/kfortune"
license=('GPL')

makedepends=('git')
install=install
source=('git+https://github.com/vojtechkral/kfortune.git')
sha256sums=('SKIP')

# _gitroot="git://github.com/vojtechkral/kfortune.git"
_gitname="kfortune"
# _builddir=$_gitname-build

pkgver()
{
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  # cd "$srcdir"
  # msg "Connecting to GIT server...."

  # if [ -d $_gitname ] ; then
  #   cd $_gitname && git pull origin
  #   msg "The local files are updated."
  # else
  #   git clone $_gitroot $_gitname
  # fi

  # msg "GIT checkout done or server timeout"
  # msg "Starting make..."

  # rm -rf "$srcdir/$_builddir"
  # git clone "$srcdir/$_gitname" "$srcdir/$_builddir"
  # cd "$srcdir/$_builddir"

  cd "${srcdir}/${_gitname}"
  make
}

package()
{
  # cd "$srcdir/$_builddir"
  cd "${srcdir}/${_gitname}"
  gzip -c9 'README.6' > 'kfortune.6.gz'
  install -D -m 755 'kfortune.ko' "$pkgdir/usr/lib/modules/`uname -r`/kernel/drivers/char/kfortune.ko"
  install -D -m 644 'kfortune.6.gz' "$pkgdir/usr/share/man/man6/kfortune.6.gz"
}
