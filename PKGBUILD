## Maintainer: realasking
pkgname=python-genanki-git
pkgver=0.4.0
pkgrel=1
pkgdesc='Generate Anki decks programmatically'
arch=(x86_64 i686)
url='http://github.com/kerrickstaley/genanki'
license=('MIT')
depends=('python' 'python-cached-property' 'python-frozendict' 'python-pystache' 'python-yaml' 'python-setuptools')
provides=('genanki')
source=()
md5sums=()

_proj=https://github.com/kerrickstaley/genanki.git
_name=genanki

build() {
	cd "$srcdir" 
	msg "Starting Git..."
	if [[ -d "$_proj" ]]; then
	    cd "$_proj" 
	    git pull origin
	else
	    git clone "$_proj" "$_name"
	fi
	msg "Project synchronization Finished."
	msg "Starting build..."
	
	cd "$_name"
	python setup.py build || return 1
}

package() {
	cd "$srcdir/$_name"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1 
}
