# Maintainer: Torsten Henschel <to at h6l dot de>
# Contributor: Karol Babioch <karol at babioch dot de>

pkgname=getssl-git
pkgver=2.49.r10.51cd039
pkgrel=1
pkgdesc="Obtain SSL certificates from the letsencrypt.org ACME server. Suitable for automating the process on remote servers."
arch=('any')
url="https://github.com/srvrco/getssl"
license=('GPL-3.0-only')
depends=('bash' 'openssl' 'curl' 'bind-tools')
optdepends=('python: optional update scripts'
            'python-dnspython: optional update scripts'
            'python-boto3: optional update scripts')
makedepends=('git')
provides=('getssl')
conflicts=('getssl')
source=("$pkgname::git+https://github.com/srvrco/getssl.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
