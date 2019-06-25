# Maintainer: James An <james@jamesan.ca>

pkgname=cloudfusion-git
_pkgname=CloudFusion
pkgver=7.5.19.r0.gc4b9412
pkgrel=2
pkgdesc='Linux file system (FUSE) to access Dropbox, Sugarsync, Amazon S3, Google Storage, Google Drive or WebDAV servers.'
arch=('any')
url="http://joe42.github.com/$_pkgname"
license=('GPL')
depends=('fuse'
         'python2-argparse'
         'python2-beautifulsoup4'
         'python2-gsutil'
         'python2-httplib2'
         'python2-nose'
         'python2-ntplib'
         'python2-profilehooks'
         'python2-psutil'
         'python2-pydrive'
         'python2-requests'
         'python2-sh'
         'python2-simplejson'
         'python2-tinydav'
)
optdepends=('opencv: automatic registration'
            'sikuli-ide: automatic registration'
            'openssl: Google Storage'
            'python2-pycurl: captcha handling during auto registration'
            'python2-lxml: captcha handling during auto registration'
            'python2-pillow: captcha handling during auto registration'
            'tesseract: captcha handling during auto registration'
            'tesseract-data-eng: captcha handling during auto registration'
)
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!emptydirs)
install=
source=("$_pkgname"::"git+https://github.com/joe42/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v\.//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
