# Contributor: Atlanis <emallson@archlinux.us>
_pkgname=python2-gmusicapi
pkgname=$_pkgname-git
pkgver=20140310
pkgrel=2
pkgdesc="Allows control of Google Music with Python"
arch=('any')
url="https://github.com/simon-weber/Unofficial-Google-Music-API"
license=('BSD')
groups=()
depends=('python2' 'python2-validictory' 'python2-decorator' 'mutagen' 'python2-protobuf' 'python2-requests' 'python2-dateutil' 'python2-proboscis' 'python2-oauth2client' 'python2-mock' 'python2-appdirs' 'python2-six' 'python2-httplib2>=0.8' 'python2-gflags')
makedepends=('python2-setuptools' 'git')
optdepends=()
provides=('python2-gmusicapi')
conflicts=('python2-gmusicapi')
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
noextract=()
_gitroot="https://github.com/simon-weber/Unofficial-Google-Music-API.git"
_gitname="$_pkgname"

package() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
