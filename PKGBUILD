# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=trellowarrior
pkgver=1.3.1
pkgrel=1
pkgdesc='Tool to sync Taskwarrior projects with Trello boards'
arch=('any')
url='https://github.com/ogarcia/trellowarrior'
license=('GPL')
depends=('python-tasklib' 'python-py-trello')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/ogarcia/trellowarrior/raw/${pkgver}/contrib/trellowarrior-completion.zsh")
sha256sums=('857018fc5ac4606662c304868c91474e310b3202ab9376929aa6e3c61456f9ee'
            '0b21723048065e24064c1eb913e870c91929a9f5e14822e803a79673671d1148')

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize='1'

  # zsh completion file
  install -Dm644 "${srcdir}/trellowarrior-completion.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_trellowarrior"

  # config file
  install -D -m644 "${pkgname}.conf" \
    "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.sample.conf"

  # doc and contributing file
  install -D -m644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 CONTRIBUTING.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
