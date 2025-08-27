# Maintainer: Kazuya Yokogawa <mapk0y at gmail.com>

pkgname='tencentcloud-cli-intl-en'
pkgver=3.0.1248.1
pkgrel=1
pkgdesc='Tencent Cloud API 3.0 Command Line Interface'
url='https://github.com/TencentCloud/tencentcloud-cli-intl-en'

_execname='tccli'
license=('Apache-2.0')
arch=('any')
depends=(
  tencentcloud-sdk-python
  python
  python-six
  python-jmespath
)
optdepends=()
makedepends=(git python-build python-installer python-setuptools python-wheel python-hatchling)
conflicts=('tencentcloud-cli')
source=(
  "${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('50193a0655b275ba4c2a8859c90950c00a69d0197abb0d7b06c08e0f1980eb69')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
      cat > completion.bash << 'EOF'
#!/bin/bash
complete -C 'tccli_completer' tccli
EOF
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/${_execname}"
}
