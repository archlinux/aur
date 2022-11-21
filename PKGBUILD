# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

_name=cheroot
pkgname=python38-cheroot
pkgdesc="Highly-optimized, pure-python HTTP server"
pkgver=8.6.0
pkgrel=2
arch=('any')
url="https://github.com/cherrypy/cheroot"
license=('MIT')
depends=('python38-jaraco.functools' 'python38-more-itertools' 'python38-six')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
'python38-setuptools-scm' 'python38-setuptools-scm-git-archive' 'python38-wheel')
# TODO: package python38-pytest-watch
# TODO: package python38-pypytools
checkdepends=(python38-apipkg python38-chardet python38-colorama
python38-jaraco.context python38-jaraco.text python38-portend python38-pyopenssl
python38-pytest python38-pytest-forked python38-pytest-rerunfailures
python38-pytest-sugar python38-pytest-xdist python38-requests-toolbelt
python38-requests-unixsocket python38-trustme python38-urllib3 python38-watchdog)
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('26e48c935fe32d4ce3cf6ae20b5b272416ca53bd8496527c2958ec2ebe87529c831f283ae900e13271b610e39531b682df0376935ecc3bcfcca11c299cd2a893')
b2sums=('97d1a9bf0a8d72d3204972934aa3ac4c97246b413edebd9f38caa802a5343acc426f137addfdc0faec58f6af2d62bc22023e93b14e1b0b07f6be9ffb12e78306')

build() {
  # setuptools wont find version from git tag
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

  cd ${_name}-${pkgver}
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ${_name}-${pkgver}
  # TODO: package remaining checkdepends and run pytest
  # pytest -vv -c /dev/null
}

package() {
  cd ${_name}-${pkgver}
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
