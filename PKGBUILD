# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=python2-pysvmlight-hg
pkgver=20130415
pkgrel=1
pkgdesc="A Python binding to the SVMlight support vector machine library by Thorsten Joachims"
arch=("i686" "x86_64")
url="https://bitbucket.org/wcauchois/pysvmlight"
license=('unknown')
makedepends=('mercurial')
depends=('python2')

_hgroot=ssh://hg@bitbucket.org/wcauchois/pysvmlight
_hgrepo=pysvmlight

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

}

package() {
  cd "$srcdir/$_hgrepo-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
