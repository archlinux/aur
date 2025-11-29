# Contributor: Alessio <alessio@linux.com>
# Contributor: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=archivebox-git
pkgver=0.8.5rc53.r247.c3024815
pkgrel=1
pkgdesc="Create a local, staticm browsable archive of websites."
arch=('x86_64' 'i686')
url="https://github.com/pirate/ArchiveBox/"
#depends=('python' 'git' 'wget' 'curl' 'youtube-dl' 'chromium')
depends=('python' 'python-abx' 'python-abx-pkg' 'python-abx-spec-abx-pkg' 'python-abx-spec-archivebox' 'python-abx-spec-config' 'python-abx-spec-django' 'python-abx-spec-searchbackend' 'python-atomicwrites' 'python-base32_crockford' 'python-benedict' 'python-click' 'python-daphne' 'python-dateparser' 'python-django' 'python-django-stubs-ext' 'python-feedparser' 'python-pluggy' 'python-pydantic' 'python-pydantic-core' 'python-pydantic-settings' 'python-python-crontab' 'python-requests' 'python-rich' 'python-rich-click' 'python-toml' 'python-urllib3' 'python-w3lib')
makedepends=('git' 'python-build' 'python-installer' 'python-pdm-backend')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
source=("archivebox::git+${url}#branch=dev")
noextract=()
sha256sums=('SKIP')
license=('MIT')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/-rc./rc/;s/\([^-]*-\)g/r\1/;s/-/./g'

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build --wheel --no-isolation
}
package() {
	cd "$srcdir/${pkgname%-git}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
