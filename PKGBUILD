# Maintainer: Falko Galperin <dr (dot) asasteghof (at) gmail (dot) com>
pkgname=paper2remarkable
pkgver=0.9.14
pkgrel=1
pkgdesc="Easily download an academic paper and send it to a reMarkable."
arch=(any)
url="https://github.com/GjjvdBurg/paper2remarkable"
license=('MIT')
# Note: While we have the choice between qpdf and pdftk,
# python-pikepdf depends on qpdf anyway, so we use that here.
depends=('python>=3.9.0' 'qpdf' 'ghostscript' 'poppler' 'rmapi' 'python-pikepdf>=2.9.0'
	'python-beautifulsoup4>=4.8' 'python-html2text>=2020.1.16' 'python-markdown>=3.1.1'
	'python-pdfplumber>=0.11' 'python-yaml>=5.1' 'python-readability-lxml>=0.7.1'
	'python-regex>=2018.11' 'python-requests>=2.21' 'python-titlecase>=0.12'
	'python-unidecode>=1.1' 'python-weasyprint>=51' 'python-validators>=0.34'
	'python-pycryptodome' 'python-cssselect' 'python-lxml-html-clean>=0.1.1')
makedepends=('python-setuptools')
optdepends=('python-readabilipy: Improves output of web articles')
changelog=$pkgname.changelog.md
install=$pkgname.install
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("8383465ee4827e0cc56d2ce1bf7c8c73429914f4113d379218ab6000143905de")

build() {
	cd "$pkgname-$pkgver/"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver/"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	# move man page to directory specified by FHS guidelines
	mkdir -p "$pkgdir/usr/share/"
	mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
}
