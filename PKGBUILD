# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='brother-bradmin-light'
pkgver='1.20.0'; _brfile='qdsel120brl'
pkgrel='1'
pkgdesc='administer Brother printers'
arch=('any')
url='http://support.brother.com/g/s/id/linux/en/download_esp.html'
license=('custom:Brother Industries')
depends=('java-environment')
source=("http://www.brother.com/pub/bsc/linux/dlf/${_brfile}.tar.gz")
sha256sums=('a6e09cf8b39be008d0cdf3cdd45c4e23ae1548720415671b8840a81359b09c39')

package() {
  set -u
  cd "${_brfile}"
  install -d "${pkgdir}/opt/brother-bradmin/"
  mv * "${pkgdir}/opt/brother-bradmin/"

  # Desktop file for config tool
  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=BRAdmin Light
GenericName=Brother Printer Manager
Comment=Administer Brother Printers
Exec=java -jar '/opt/brother-bradmin/BRAdmin Light.jar'
Terminal=false
Type=Application
#Icon=
Categories=Settings;Utility;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/brother-bradmin-light.desktop"
  set +u
}
set +u
