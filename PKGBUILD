# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=duplicity-git
pkgver=0.8.17.dev29
pkgrel=1
pkgdesc='A utility for encrypted, bandwidth-efficient backups using the rsync algorithm.'
arch=('x86_64')
url='https://www.nongnu.org/duplicity/'
license=('GPL')
depends=('gnupg' 'librsync' 'python-paramiko' 'python-fasteners' 'python-future')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optdepends=('lftp: backend for ftp, ftps, fish'
    'ncftp: alternative backend for ftp'
    'python-boto: Amazon S3 and Google Cloud Storage backend'
    'python-dropbox: Dropbox backend'
    'python-gobject: GIO backend'
    'gvfs: GIO backend'
    'python-pydrive: Google Drive backend'
    'python-requests-oauthlib: OneDrive backend'
    'rsync: rsync backend')
source=("git+https://gitlab.com/${pkgname%-git}/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py --version
}

build() {
    # Go through sdist because it puts version into some files.
    cd "$srcdir/${pkgname%-git}"
    python setup.py sdist
    tar -xf "dist/${pkgname%-git}-${pkgver}.tar.gz"
}

package() {
    cd "$srcdir/${pkgname%-git}/${pkgname%-git}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
