# Maintainer: Clara Carrasquel Fiorini <claracarrasquelfiorini@gmail.com>
pkgname=keys-per-second-bin
pkgver=8.4
pkgrel=1
pkgdesc="A keys-per-second meter & counter. Written for osu! but should work for other rhythm games too."
arch=(x86_64 i686 i386)
url="https://github.com/RoanH/KeysPerSecond"
license=('GPL')
groups=()
depends=('java-runtime')
makedepends=('curl')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=

source=("https://github.com/RoanH/KeysPerSecond/releases/download/v${pkgver}/KeysPerSecond-v${pkgver}.jar"
        "https://raw.githubusercontent.com/RoanH/KeysPerSecond/master/README.md"
        "https://raw.githubusercontent.com/RoanH/KeysPerSecond/master/LICENSE"
        "https://raw.githubusercontent.com/RoanH/KeysPerSecond/master/CHANGELOG.md"
        "kps.ico" "kps.sh" "keys-per-second.desktop")

noextract=("KeysPerSecond-v${pkgver}.jar" "README.md" "LICENSE" "CHANGELOG.md"
           "kps.ico" "kps.sh" "keys-per-second.desktop")

sha256sums=('97cd3d8d3ad8b6baf9a17e332f1385004dff721c9b3a844f588e432cdd19b3f5'
            '40cfd8bfe87a7dea4b48d5179ce1f3a162c7f3374a3f2aab8cd11c9dde004684'
            '5661ce65ea72ca0d6ab176854c7acc72f448f722ad5a8dba95a262214a9da043'
            'a61d236ad5aa3931977ddf43ac991295c6578ad4a3a292660aba735abb8364dd'
            '20c6cf8b229c3841e50fea38aba5ddd2242537508df34a2dbddb38e3b5286aea'
            '7ad2e29e09958c2ec84622e1c84bc7fa744514b2fe39611c65949338eee1dc8d'
            '19516eb3722c8d3c5ae84aa114ecafdb8d394683c3494597371157b1b41c95f3')


pkgver() {
  printf $(curl --silent "https://api.github.com/repos/RoanH/KeysPerSecond/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | tr -d v)
}


package() {
  # Copy required files to the KPS directory
  mkdir -p ${pkgdir}/opt/KeysPerSecond                                            # Create KPS dir
  cp kps.ico ${pkgdir}/opt/KeysPerSecond                                          # Copy the icon
  cp KeysPerSecond-v${pkgver}.jar ${pkgdir}/opt/KeysPerSecond/KeysPerSecond.jar   # Copy the jar file

  # Install the .desktop entry and the shell script 
  install -Dm644 keys-per-second.desktop ${pkgdir}/usr/share/applications/keys-per-second.desktop
  install -Dm777 kps.sh ${pkgdir}/opt/KeysPerSecond/kps.sh

  # install the README, LICENSE and CHANGELOG docs
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
