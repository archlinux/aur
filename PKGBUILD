#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
pkgname=mongars
pkgver=1.4.5
pkgrel=1
pkgdesc="Count inbox emails using Gnome Online Accounts or Google GMAIL API"
arch=('any')
url="https://github.com/chmouel/mongars"
license=('Apache')
optdepends=('gum' 'python-gobject' 'evolution-data-server')
depends=('python-google-api-core' 'python-google-api-python-client' 'python-google-auth' 'python-google-auth-httplib2' 'python-google-auth-oauthlib' 'python-googleapis-common-protos' 'pass' 'libnotify')
source=("https://github.com/chmouel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7607318ed870cd4efd017ebf0f9800f43af35f9e1c21a08df61595d76d0df6cf')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

build() {
  cd "$pkgname-$pkgver" || exit
  rm -vf LICENSE
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}
