# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot
pkgver=1.21.0
pkgrel=3
pkgdesc="A tool to automatically receive and install X.509 certificates to enable TLS on servers. The client will interoperate with the Let’s Encrypt CA which will be issuing browser-trusted certificates for free."
arch=('any')
license=('Apache')
url="https://certbot.eff.org"
depends=('ca-certificates' 'python-acme' 'python-configargparse' 'python-configobj'
         'python-cryptography' 'python-distro' 'python-parsedatetime'
         'python-pyrfc3339' 'python-pytz' 'python-setuptools' 'python-zope-component'
         'python-zope-interface')
checkdepends=('python-pytest')
optdepends=('certbot-apache: Apache plugin for Let’s Encrypt client'
            'certbot-nginx: Nginx plugin for Let’s Encrypt client')
replaces=("letsencrypt")
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2'
              '20F201346BF8F3F455A73F9A780CC99432A28621')
sha512sums=('ad707e7e8fd345859f92d3b2d642df4ac3c0623a5b240908eed7aeb43fb07705c0fd157f066201bd576e86bfeec37bc2e3114de6a2e6d7d68109f1b86f816b53'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  python -m pytest
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"

  mkdir -p "$pkgdir"/{etc,var/lib,var/log}/letsencrypt
  chmod 700 "$pkgdir"/var/log/letsencrypt
}
