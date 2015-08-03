# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributors: bepebe, cconrad

pkgname=softmaker-office-bin
pkgver=2012.698
pkgrel=1
pkgdesc="Softmaker Office 2012, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
install=smoffice2012.install

# Set dependencies for i686 or x86-64
if [ "$CARCH" == "x86_64" ]; then
   depends=('desktop-file-utils' 'shared-mime-info' 'lib32-libxrender' 'lib32-libxmu' 'lib32-gcc-libs')
elif [ "$CARCH" == "i686" ]; then
   depends=('desktop-file-utils' 'shared-mime-info' 'libxrender' 'libxmu' 'gcc-libs')
fi

source=("http://www.softmaker.net/down/2012/softmaker-office-2012-698.tgz"
        "planmaker-2012.desktop"
        "planmaker12"
        "presentations-2012.desktop"
        "presentations12"
        "textmaker-2012.desktop"
        "textmaker12"
        "icons.zip")
md5sums=('36aa37f078417fae960a40d7cdc0d9c8'
         '853c710b2c97e8c7ef4680be82fe15d4'
         'bd742e02bb99c207f0941bf7bf87142a'
         'c24cffb25d883290f1c9a147195b8ef7'
         'a26a4a3008db7ed26870e84a8a770be8'
         '835dce4ec39e8ae158deed1e61f0958c'
         '9e0ad29740ec780afefaec44550a7d20'
         '5d7eaa0fd220caa4c95da6caa174ccf0')
sha512sums=('b0f1b5f6dcf60952eb9c7a4122cdb0ec1f469e198cb98f4067ac2e096444ff8572dbff78fa57a6888324d1daa9ed53fa1fa198494317075aa28094c9e3b60c83'
            'c23d5fe6c9f83036196fc12e2f4862186986efb4db2aa740ea4d9b8751a42779057b43d496f4a317b83c0bfe682001911870a56658daaa11b5aa1c6dc90f2abb'
            'a0682318dae6894a9eb33797e50ef29f4304856174575f2b0c7cca145b0e8fc297e49c01101e70ea384b67cc0deb66f961a102d2b8dcf5aabc8adf3390516f7a'
            'a6c8af74c152be6ff52456ddb42a5b58ff1d3be1d3ca2be36cf794ecb0ce5b53d9bdd7f9579dac211d8e78555a7c1241c2422cbcfa9c9259d243628ff38f66fc'
            'a0d17b147dfe9a5cf1f1eedc2288713c8de15923336a2be4dbe8bff7f75fe456b4e70078fb2aa3b0e286a73feff55b6c28a6ebf0457663019acae574dd08d43e'
            '3e53a622b8d800b2a86ff4312c7c69d1794b660e0903e6d7a335f92641967d958326ad334f09f6f61e210cf685c6bbd6b39d8bd297858f229e0ee3d6bb537c67'
            '4508a4ae1a983b250608fafac4e3c5cb571768e3b818bd0fdbac9f2b84e9e87deeea9b037c967c5d3086b8ea6df9d4f43d8147558bf59c4b47b2b342d9133509'
            'e3ad01cc282eee3589a5b128d1e6575239aa19f3aa2570f60b6ceca014158e9280ea51ff772b23be4a7480b263dee6caab8bddf6de688bdd87734ede11a7c74c')

package() {
   mkdir -p "${pkgdir}/opt/smoffice2012"
   cd "${pkgdir}/opt/smoffice2012"
   tar -xzf "${srcdir}/office.tgz"
   install -Dm755 "${srcdir}/planmaker12" "${pkgdir}/usr/bin/planmaker12"
   install -Dm755 "${srcdir}/presentations12" "${pkgdir}/usr/bin/presentations12"
   install -Dm755 "${srcdir}/textmaker12" "${pkgdir}/usr/bin/textmaker12"
   install -Dm644 "${srcdir}/textmaker-2012.desktop" "${pkgdir}/usr/share/applications/textmaker-2012.desktop"
   install -Dm644 "${srcdir}/presentations-2012.desktop" "${pkgdir}/usr/share/applications/presentations-2012.desktop"
   install -Dm644 "${srcdir}/planmaker-2012.desktop" "${pkgdir}/usr/share/applications/planmaker-2012.desktop"
   mkdir -p "${pkgdir}"/usr/share/mime/packages
   install -Dm644 "${pkgdir}/opt/smoffice2012/mime/softmaker-office-2012.xml" "${pkgdir}/usr/share/mime/packages"
   mkdir -p "${pkgdir}"/usr/share/icons/hicolor
   cp -r "${srcdir}"/hicolor/* "${pkgdir}"/usr/share/icons/hicolor
}
