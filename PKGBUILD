# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>


pkgname='python-jira'
pkgdesc='Python library to work with Jira APIs'
pkgver='3.0.1'
pkgrel=2
url='https://github.com/pycontribs/jira'
license=('BSD')
arch=('any')
depends=('python-defusedxml'
         'python-keyring'
         'python-requests'
         'python-requests-oauthlib'
         'python-requests-toolbelt')
optdepends=("ipython")
makedepends=('python-setuptools')
source=("https://github.com/pycontribs/jira/archive/refs/tags/$pkgver.tar.gz"
        "version.patch")
sha256sums=('feb5f77431728aee7c99bca65f00c9f39682720369c7f24c0cf932049a72ec5f'
            '1526a7899a67fd8388c4b3fc878de85da3d7589810e911680cd2d2adb15c1021')


prepare() {
  cd "${srcdir}/jira-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/version.patch"
}

package() {
  cd "${srcdir}/jira-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
