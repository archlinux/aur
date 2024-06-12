# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=trellowarrior
pkgver=1.3.3
pkgrel=1
pkgdesc='Tool to sync Taskwarrior projects with Trello boards'
arch=('any')
url='https://github.com/ogarcia/trellowarrior'
license=('GPL-3.0-or-later')
depends=('python-tasklib' 'python-py-trello')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/ogarcia/trellowarrior/raw/${pkgver}/contrib/trellowarrior-completion.zsh")
b2sums=('ae16133d581a48c1e171f4ffc677f2830becfd3f4f283f50457788b651be77601480b15270687406949ad617b7cb40b750a54bcc7a6968b76748dd5d733a1ff8'
        'ed782ec5109486e05e164c57f757f01f863252663061d68a19ac3d02afe7a2df7bbeaaf593ad6e245ed47ba630028edf6bdc5c1471996333ab19aa8e30032900')

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
