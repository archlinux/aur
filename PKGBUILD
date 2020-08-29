# Maintainer: Michael Riegert <michael at eowyn net>
# Contributor: Deepjyoti <deep.barman30@gmail.com>
pkgname=ytmdl-git
_pkgname=ytmdl
pkgver=2020.07.26.r26.gde1fa38
pkgrel=1
pkgdesc="Download songs from YouTube with metadata from sources like Itunes and Gaana"
arch=("any")
url="https://github.com/deepjyoti30/ytmdl"
license=('MIT')
depends=(
		"python>=3.6"
		"ffmpeg"
		"youtube-dl"
		"python-mutagen"
		"python-beautifulsoup4"
		"python-colorama"
		"downloader-cli"
		"python-itunespy"
		"python-ffmpeg"
		"python-pysocks"
		"python-xdg"
		"python-requests"
		"python-lxml"
		"python-wheel"
		"python-youtube-search-git"
		"python-unidecode"
		"python-pydes"
		)
makedepends=("git" "python-setuptools")
optdepends=("tensorflow: Trim Support")
provides=("ytmdl")
conflicts=("ytmdl")
source=("$_pkgname::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^lightspark-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python setup.py build
}

package() {
	cd "$_pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
