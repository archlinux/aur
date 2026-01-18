# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: whiteman808 <whiteman808@paraboletancza.org>

pkgname='certbot-dns-porkbun-git'
pkgver='r263.3439926'
pkgrel=1
pkgdesc='Plugin for certbot to obtain certificates using a DNS TXT record for Porkbun domains'
arch=('any')
license=('MIT')
url='https://github.com/infinityofspace/certbot_dns_porkbun'
depends=('certbot>=1.18.0'
         'python-dnspython'
         'python-pkb-client-git'
         'python-requests'
         'python-tldextract')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')
provides=('certbot-dns-porkbun')
conflicts=('certbot-dns-porkbun')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
