# Maintainer: Vlad Petrov <ejiek@mail.ru>
pkgname=nb
pkgver=5.7.5
pkgrel=1
pkgdesc="A command line note-taking, bookmarking, archiving, and knowledge base application"
arch=('any')
url="https://github.com/xwmx/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
license=('AGPL3')
depends=('bash' 'git')
optdepends=('bat' 'pandoc' 'ripgrep' 'w3m' 'tig')
provides=("$pkgname")
conflicts=("$pkgname")
sha512sums=('934ee71d2dd7d06f2e06dafbcac7eaace12afeb0f37bef3715004bd171c079bee3b843336a203a34b415408106028e63d2a7008b548a0399c50c2a03948838ef')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # setup completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions" \
                  "${pkgdir}/usr/share/zsh/site-functions" \

  install -D -m644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -D -m644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim:set ts=2 sw=2 et:
