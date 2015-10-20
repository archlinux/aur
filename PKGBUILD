# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=pelican
pkgver=3.6.3
pkgrel=3
pkgdesc="A tool to generate a static blog, with restructured text (or markdown) input files."
arch=('any')
url="http://getpelican.com"
license=('AGPL3')
makedepends=('python-sphinx' 'python-blinker')
depends=('python-jinja' 'python-pygments' 'python-feedgenerator' 'python-pytz'
         'python-docutils' 'python-blinker' 'python-unidecode' 'python-six'
         'python-dateutil')
optdepends=('python-markdown: Markdown support'
            'asciidoc: AsciiDoc support'
            'python-beautifulsoup4: importing from wordpress/dotclear/posterous'
            'python-feedparser: importing from feeds'
            'python-rst2pdf: PDF generation'
            'openssh: uploading through SSH'
            'rsync: uploading through rsync+SSH'
            'lftp: uploading through FTP'
            's3cmd: uploading through S3'
            'ghp-import: uploading through gh-pages'
            'python-typogrify: typographical enhancements'
            'python-mdx-video: easier embedding of youtube videos in markdown')
source=("$pkgname-$pkgver.tar.gz::https://github.com/getpelican/pelican/archive/$pkgver.tar.gz")
sha256sums=('d19bc7df61afc5b68eba028f0cf0832ee2a12a04a01d7fe11bdfdd847ddd417b')

build() {
    cd "$srcdir/$pkgname-$pkgver/docs/"
    make man
    make text
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir/usr/share/man/man1/"
    install -Dm644 docs/_build/man/*.1 "$pkgdir/usr/share/man/man1/"

    install -d "$pkgdir/usr/share/doc/pelican/"
    install -Dm644 docs/_build/text/*.txt "$pkgdir/usr/share/doc/pelican/"

    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
