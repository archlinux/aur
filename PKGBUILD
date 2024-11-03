# Maintainer: Self Denial <selfdenial@pm.me>
pkgname='screenshot_llm'
_pkgname='Screenshot_LLM'
pkgdesc='AI-Powered Screenshot Analysis'
pkgver='1.0.1'
pkgrel='1'
arch=('x86_64')
url="https://github.com/ThanabordeeN/${_pkgname}"
license=('MIT')
conflicts=("${pkgname}-git")
depends=('python' 'tk' 'python-dotenv' 'python-markdown')
optdepends=('ollama: ollama support.')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3ec6546fbedcd101af3b17f3649a05534568400491707fa918c542d73325f2c867a511fffddd9c99221aa94e3128f198754167388150e0e4b6327b5f82f8db6e')

package() {
  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}-${pkgver}/"* "${pkgdir}/usr/lib/${_pkgname}"

  # Add script symlink under /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname,,}"

  # Install service
  install -D -m 644 "${srcdir}/${_pkgname}-${pkgver}/systemd/user/${_pkgname,,}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname,,}.service"
  install -D -m 644 "${srcdir}/${_pkgname}-${pkgver}/systemd/Screenshot_LLM_systemd.desktop" "${pkgdir}/usr/share/applications/Screenshot_LLM.desktop"

  echo "********************"
  echo "To enable and start the service:"
  echo "systemctl --user enable --now ${_pkgname,,}.service"
  echo "********************"
}
