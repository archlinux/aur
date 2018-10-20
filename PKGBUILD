# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=poetry
pkgver=0.12.3
pkgrel=1
pkgdesc="Python dependency management and packaging made easy."
arch=('any')
url="https://github.com/sdispater/poetry"
license=('MIT')
depends=(
  'python>=3.4'

  #'python-cleo>=0.6.7'
  # in vendor cleo-0.6.8
  # pyproject.toml:
  #pylev = "^1.3"
  #pastel = "^0.1.0"
  #'python-pylev>=1.3'
  # in vendor pylev-1.3.0
  #'python-pastel>=0.1.0'
  # in vendor pastel-0.1.0

  'python-requests>=2.18'

  #'python-cachy>=0.2'
  # in vendor cachy-0.2.0

  'python-requests-toolbelt>=0.8.0'

  #'python-jsonschema>=3.0a3'
  # in vendor jsonschema-3.0.0a3'

  'python-pyrsistent>=0.14.2'
  'python-pyparsing>=2.2'

  'python-cachecontrol>=0.12.4'
  # pyproject.toml: `cachecontrol = { version = "^0.12.4", extras = ["filecache"] }`
  # cachecontrol setup.py: `extras_require={"filecache": ["lockfile>=0.9"], "redis": ["redis>=2.10.5"]},`
  'python-lockfile>=0.9'

  'python-pkginfo>=1.4'
  'python-html5lib>=1.0'

  #'python-shellingham>=1.1'
  # in vendor shellingham-1.1.0

  #'python-tomlkit>=0.4.4'
  # in vendor tomlkit-0.4.4
)
conflicts=('python-poetry')
options=(!emptydirs)
source=(
  "poetry-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/23/86/9166b68a9b9084eca5a3a53ef6131b3318a0b9c48ee8593623330e164c85/poetry-0.12.3.tar.gz"
  "cleo-0.6.8.tar.gz::https://files.pythonhosted.org/packages/cb/9f/8dd57785485b2a2746edbe598a31b0852740a1ff91a2739c104b628c8520/cleo-0.6.8.tar.gz"

  # dependencies of cleo-0.6.8
  'pylev-1.3.0.tar.gz::https://files.pythonhosted.org/packages/cc/61/dab2081d3d86dcf0b9f5dcfb11b256d76cd14aad7ccdd7c8dd5e7f7e41a0/pylev-1.3.0.tar.gz'
  'pastel-0.1.0.tar.gz::https://files.pythonhosted.org/packages/bd/13/a68f2e448b471e8c49e9b596d569ae167a5135ac672b1dc5f24f62f9c15f/pastel-0.1.0.tar.gz'

  "cachy-0.2.0.tar.gz::https://files.pythonhosted.org/packages/68/ef/eabaf6c36bb87e4c1a74790b19e44064df25e09a55f191eb71ccd2b512ad/cachy-0.2.0.tar.gz"
  "jsonschema-3.0.0a3.tar.gz::https://files.pythonhosted.org/packages/47/e1/afd760aa29665e61142811ef6ea8b8f79e43574ac8427473a11f6e918a10/jsonschema-3.0.0a3.tar.gz"
  "shellingham-1.1.0.tar.gz::https://files.pythonhosted.org/packages/28/44/2da09f0d1f93b69d64183029fb64ee882d29eb430364e189562e0a69e3fc/shellingham-1.1.0.tar.gz"
  "tomlkit-0.4.4.tar.gz::https://files.pythonhosted.org/packages/d4/de/a9b1089e62b2d9df0ec585e062a22961a3430edae2e87123362d730b234c/tomlkit-0.4.4.tar.gz"
  "poetry.py"
)
sha256sums=(
  # poetry-0.12.3.tar.gz
  'dbc6f7269f8015d2f2408471f2b2eec2365b5bfd20cff8d9824664b67505aaae'
  # cleo-0.6.8.tar.gz
  '85a63076b72ca376fb06668be1fc7758dc16740b394783d5cc65200c4b32f71b'
  # pylev-1.3.0.tar.gz
  '063910098161199b81e453025653ec53556c1be7165a9b7c50be2f4d57eae1c3'
  # pastel-0.1.0.tar.gz
  '3108af417ec0fa6d0a620e676ec4f02c839ca13e10611586e5d2174b46aa0bc3'
  # cachy-0.2.0.tar.gz
  'b71513e5a38ce90c1280c02b7d8d6bb3fdf64666c9cc0584f2479afea097d56c'
  # jsonschema-3.0.0a3.tar.gz
  'dfd8426040892c8d0ef6da574085f282569f189cb24b70091a66c21c12d6705e'
  # shellingham-1.1.0.tar.gz
  'aac73de40225e3d63b4e8f7dc33adae2cae4d10ff0b09a32a0dc45151e34daa2'
  # tomlkit-0.4.4.tar.gz
  'ca181cee7aee805d455628f7c94eb8ae814763769a93e69157f250fe4ebe1926'
  # poetry.py
  'cdf402be1771636f52cae956bd9eeb84684f0d0288d4cb7d96ff744a8c002f48'
)

build() {
  #cd "${srcdir}/${pkgname}-${pkgver}"
  #python get-poetry.py --version "${pkgver}"

  # See `poetry-0.12.3/poetry/__init__.py` !
  export _pyver_minor=`python -c "import sys; print('py{}'.format('.'.join(str(v) for v in sys.version_info[:2])))"`

  # vendor
  cd "${srcdir}"
  rm -rf "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor"
  install -d "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}"
  cp -r cleo-0.6.8/cleo "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/cleo"
  cp pylev-1.3.0/pylev.py "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/pylev.py"
  cp -r pastel-0.1.0/pastel "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/pastel"
  cp -r cachy-0.2.0/cachy "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/cachy"
  cp -r jsonschema-3.0.0a3/jsonschema "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/jsonschema"
  cp -r shellingham-1.1.0/src/shellingham "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/shellingham"
  cp -r tomlkit-0.4.4/tomlkit "${srcdir}/${pkgname}-${pkgver}/poetry/_vendor/${_pyver_minor}/tomlkit"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # https://stackoverflow.com/a/122340/3449199
  export _site_packages_dir=`python -c "import sysconfig; print(sysconfig.get_paths()['purelib'])"`

  install -d "${pkgdir}${_site_packages_dir}"
  cp -r poetry "${pkgdir}${_site_packages_dir}/poetry"

  install -Dm755 "${srcdir}/poetry.py" "${pkgdir}/usr/bin/poetry"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # licenses of vendor packages
  cd "${srcdir}"
  install -Dm644 cleo-0.6.8/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/cleo.LICENSE"
  install -Dm644 shellingham-1.1.0/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/shellingham.LICENSE"
  install -Dm644 tomlkit-0.4.4/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/tomlkit.LICENSE"
}
