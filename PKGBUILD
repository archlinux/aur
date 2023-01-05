# Maintainer: Marcel Campello <marcel.campello@prafrentex.com.br>
pkgname=leiningen-full

pkgver=2.10.0
pkgrel=1

pkgdesc='For automating Clojure projects without setting your hair on fire.'
arch=('any')
url='https://codeberg.org/leiningen/leiningen'
license=('EPL')

depends=('java-environment')
optdepends=('rlwrap: for readline support')

provides=('leiningen')
conflicts=('leiningen'
           'leiningen-with-completion')
replaces=('leiningen-with-completion')

source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.jar")
sha256sums=('6b04dbe0934ab4c34dc27b0055ad290d2ba9c0f454c1bda7defa58d62946b743'
            'd27299bad34075ac2864d0bd0559f835c6e2c476c0b0a283bcbdb574fdadbb34')
noextract=("leiningen-${pkgver}-standalone.jar")

package() {
  cd "${srcdir}/leiningen"

  # command script and JAR file
  install bin/lein -t "${pkgdir}/usr/bin" -Dm 0755
  install "${srcdir}/leiningen-${pkgver}-standalone.jar" -t "${pkgdir}/usr/share/java" -Dm 0644

  # man page, documentation and license
  install doc/lein.1 -t "${pkgdir}/usr/share/man/man1" -Dm 0644
  install doc/ja/lein_ja.1 -T "${pkgdir}/usr/share/man/ja/man1/lein.1" -Dm 0644

  local docdir="${pkgdir}/usr/share/doc/leiningen"
  install doc/*.md -t "${docdir}" -Dm 0644
  install CONTRIBUTING.md -t "${docdir}" -Dm 0644
  install NEWS.md -t "${docdir}" -Dm 0644
  install README.md -t "${docdir}" -Dm 0644
  install sample.project.clj -t "${docdir}" -Dm 0644

  install  COPYING -t "${pkgdir}/usr/share/licenses/leiningen" -Dm 0644

  # shell completions
  install bash_completion.bash -T "${pkgdir}/usr/share/bash-completion/completions/lein" -Dm 0644
  install zsh_completion.zsh -T "${pkgdir}/usr/share/zsh/site-functions/_lein" -Dm 0644
  install pcmpl-lein.el -t "${pkgdir}/usr/share/emacs/site-lisp" -Dm 0644
}
