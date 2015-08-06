# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=pelican
pkgver=3.6.2
pkgrel=3
pkgdesc="A tool to generate a static blog, with restructured text (or markdown) input files."
arch=('any')
url="http://getpelican.com"
license=('AGPL3')
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
            'python-typogrify: typographical enhancements')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('393eb7c19ed99336c2fb542084ada81d6db2c8ebb7a3f63066e27fc2eae2cef6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  msg2 "Fixing wrong file permissions..."
  find "${pkgdir}/usr/lib/python3.4/site-packages/pelican/themes" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/python3.4/site-packages/pelican/themes" -type f -exec chmod 644 {} \;
  chmod 644 "${pkgdir}/usr/lib/python3.4/site-packages/pelican-3.6.2-py3.4.egg-info/"*
}

