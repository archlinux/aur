# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=oczclout
pkgver=4.02.00.695
pkgrel=3
pkgdesc="A command line interface (CLI) based tool for managing OCZ enterprise SSD including firmware and BIOS updates."
arch=('x86_64')
url="https://ocz.com/us/download/"
license=('custom')
source=("https://ocz.com/download/software/clout/clout_v${pkgver//./_}_linux.tar.gz"
        "UserGuide.pdf"::"https://ocz.com/download/software/clout/CLOUT_UserGuide_English.07112016.pdf")
sha256sums=('7dbe23572ed956fb00d45a904d4adbdda995befaf99a3dc9cc428b817b34d145'
            '9632af47a6dc63710e9d543d69b29d227820f4d5471f72bef7793ee3b8181968')

package() {
  cd "clout_v${pkgver//./_}_linux"
  # Install license file
  install -D -m 644 "EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf"
  # Install files
  if [ "$CARCH" = "x86_64" ]; then
    cd "linux64"
  else
    cd "linux32"
  fi
  install -D -m 755 "clout" "${pkgdir}/usr/bin/clout"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.txt" "${srcdir}/UserGuide.pdf"
}
