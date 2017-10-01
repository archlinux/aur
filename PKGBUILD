# Maintainer: lothar_2
pkgname=python-json2csv-git
pkgver=1
pkgrel=1
pkgdesc="A converter to extract nested JSON data to CSV files."
arch=('any')
url="https://github.com/evidens/json2csv"
license=('MIT')
groups=()
depends=('python'
        'python2-unicodecsv')
makedepends=('python-setuptools'
			'python-pip'
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
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"
  #make DESTDIR="$pkgdir/" install
  python setup.py install --root="$pkgdir/" --optimize=1
}

