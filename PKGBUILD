# Maintainer: Marcel Campello <tucho@prafrentex.com.br>
pkgname=leiningen-with-completion
pkgver=2.9.4
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
sha256sums=('be1b1e43c5376f2fdc8666aeb671df16c19776d5cfe64339292a3d35ce3a7faa'
            '0e3c339480347df0445317d329accbd4a578ebbd8d91e568e661feb1b388706c')
noextract=("leiningen-${pkgver}-standalone.zip")

package() {
  cd ${srcdir}/leiningen-${pkgver}
  install -Dm 0755 bin/lein ${pkgdir}/usr/bin/lein
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
