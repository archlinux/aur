# Maintainer: lothar_2
pkgname=python-json2csv-git
pkgver=1
pkgrel=1
pkgdesc="A python2 converter to extract nested JSON data to CSV files."
arch=('any')
url="https://github.com/evidens/json2csv"
license=('MIT')
groups=()
depends=('python2'
        'python2-unicodecsv')
makedepends=('python2-setuptools'
			'python2-pip'
			'git')
provides=('python-json2csv')
conflicts=()
replaces=()
backup=()
options=()
install=()
source=("https://github.com/evidens/json2csv.git")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot="git://github.com/evidens/json2csv.git"
_gitname='json2csv'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  #make DESTDIR="$pkgdir/" install
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

