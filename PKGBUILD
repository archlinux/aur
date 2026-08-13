# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-authenticator
pkgname=python-$_name
pkgver=0.4.2
pkgrel=1
pkgdesc='User authentication component for Streamlit apps'
arch=(any)
url='https://github.com/mkhorasani/Streamlit-Authenticator'
# NOT MIT, despite setup.py declaring "License :: OSI Approved :: MIT License".
# The shipped LICENSE is a proprietary licence: use is granted free of charge for
# any purpose including commercial, but clause 2 forbids redistributing or selling
# copies "as your own work" without written permission. Packaging here is fine --
# a PKGBUILD is a build recipe and the source is fetched from upstream at build
# time, so nothing is redistributed -- but the licence field must not claim MIT.
license=(LicenseRef-Proprietary)
depends=(
  python
  python-bcrypt
  python-captcha
  python-cryptography
  python-extra-streamlit-components
  python-pyjwt
  python-streamlit
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# PyPI ships a wheel only for this release, so the source comes from the git tag.
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ca156de88830bf53dc69f690f57b4ef75dd18c6f72b819c197672110570ff34f')

build() {
  cd Streamlit-Authenticator-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd Streamlit-Authenticator-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
