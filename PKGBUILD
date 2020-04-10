# Maintainer: Marcel Campello <tucho@prafrentex.com.br>
pkgname=leiningen-with-completion
pkgver=2.9.3
pkgrel=1
pkgdesc="For automating Clojure projects without setting your hair on fire."
arch=('any')
url="https://github.com/technomancy/leiningen"
license=("EPL")
depends=('java-environment')
optdepends=('rlwrap: for readline support')
conflicts=('leiningen')

source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/leiningen-${pkgver}-standalone.zip")
sha256sums=('98cc1e58ebe0d71fede73ae6c7699f1b9b944650d57a220e576bc95a3185b846'
            '23e1df18bc97226d570f47335a8d543e1b759ea303544ea57d5309be3dedcbbb')
noextract=("leiningen-${pkgver}-standalone.zip")

package() {
  cd ${srcdir}/leiningen-${pkgver}
  install -Dm 0755 bin/lein-pkg ${pkgdir}/usr/bin/lein
  install -Dm 0644 zsh_completion.zsh ${pkgdir}/usr/share/zsh/site-functions/_lein
  install -Dm 0644 -D bash_completion.bash ${pkgdir}/usr/share/bash-completion/completions/lein
  install -Dm 0644 doc/lein.1 ${pkgdir}/usr/share/man/man1/lein.1
  install -d ${pkgdir}/usr/share/doc/leiningen
  install -Dm 0644 doc/*.md ${pkgdir}/usr/share/doc/leiningen
  install -Dm 0644 CONTRIBUTING.md ${pkgdir}/usr/share/doc/leinigen
  install -Dm 0644 NEWS.md ${pkgdir}/usr/share/doc/leinigen
  install -Dm 0644 README.md ${pkgdir}/usr/share/doc/leiningen

  install -D ${srcdir}/leiningen-${pkgver}-standalone.zip ${pkgdir}/usr/share/java/leiningen-${pkgver}-standalone.jar
}
