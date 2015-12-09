# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributors: bepebe, cconrad

pkgname=softmaker-office-2012-bin
pkgver=2012.702
pkgrel=3
pkgdesc="Softmaker Office 2012, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
install=smoffice2012.install

# Set dependencies for i686 or x86-64
depends_i686=('desktop-file-utils' 'shared-mime-info' 'lib32-libxrender' 'lib32-libxmu' 'lib32-gcc-libs' 'hicolor-icon-theme')
depends_x86_64=('desktop-file-utils' 'shared-mime-info' 'libxrender' 'libxmu' 'gcc-libs' 'hicolor-icon-theme')

source=("http://www.softmaker.net/down/2012/softmaker-office-2012-702.tgz"
        "planmaker-2012.desktop"
        "planmaker12"
        "presentations-2012.desktop"
        "presentations12"
        "textmaker-2012.desktop"
        "textmaker12"
        "license.txt")
md5sums=('df333512e49aea146d21ef0fdf835061'
         '5bf1c347e1fe8304b28e0b5dbfd62a44'
         'bd742e02bb99c207f0941bf7bf87142a'
         'deffe64185ea1bdec019fe89bcb239b7'
         'a26a4a3008db7ed26870e84a8a770be8'
         'e370554e5d3c232da168baeda42950ad'
         '9e0ad29740ec780afefaec44550a7d20'
         '00e002e7ac0f54d5eeaa57c50884f3e9')
sha512sums=('1299676a51e91616f363877dc02886a17ffb28e4e4792962ffa64aca75fe71930dfc67d720a36f41cacb89ebb5fe8c739b5b8cbe0027ae31b295c2edcc687149'
            'e096dbf916eae537a86d089932130cce26120cb5ce903ca674fed58dbbf5c43ec313e68ec7f3432e903721af0a377ab37baa81f15f8cf3a8bf423a871903c898'
            'a0682318dae6894a9eb33797e50ef29f4304856174575f2b0c7cca145b0e8fc297e49c01101e70ea384b67cc0deb66f961a102d2b8dcf5aabc8adf3390516f7a'
            '7ce55190801072226519c2c5f8654b92a23f07960ec1aff3b3ac295cb116c358a40a48a6921f551388de4e54f7fcc75f7a01299c920c8f4f8405ce2cefc7a39b'
            'a0d17b147dfe9a5cf1f1eedc2288713c8de15923336a2be4dbe8bff7f75fe456b4e70078fb2aa3b0e286a73feff55b6c28a6ebf0457663019acae574dd08d43e'
            '81caa86fa1dd8a297c809964bfcc0b8fc0a7f929f2c17b6fc6e8ec47eddb6ed6105159eebae516f2bbb93e3aceff7abadcc24015d4a4b507daed445f67780fc6'
            '4508a4ae1a983b250608fafac4e3c5cb571768e3b818bd0fdbac9f2b84e9e87deeea9b037c967c5d3086b8ea6df9d4f43d8147558bf59c4b47b2b342d9133509'
            '25464fd669e6d81ccdfd0511e911f7344912e66526cdab4c2dc9fb6e9b65a6f83a328cafe99827bb012800fb2e923f4b00c4a652432710a59597d71759121c33')

package() {
   mkdir -p "${pkgdir}/opt/smoffice2012"
   tar -xzf "${srcdir}/office.tgz" -C "${pkgdir}/opt/smoffice2012"

   install -Dm755 "${srcdir}/planmaker12" "${pkgdir}/usr/bin/planmaker12"
   install -Dm755 "${srcdir}/presentations12" "${pkgdir}/usr/bin/presentations12"
   install -Dm755 "${srcdir}/textmaker12" "${pkgdir}/usr/bin/textmaker12"

   install -Dm644 "${srcdir}/textmaker-2012.desktop" "${pkgdir}/usr/share/applications/textmaker-2012.desktop"
   install -Dm644 "${srcdir}/presentations-2012.desktop" "${pkgdir}/usr/share/applications/presentations-2012.desktop"
   install -Dm644 "${srcdir}/planmaker-2012.desktop" "${pkgdir}/usr/share/applications/planmaker-2012.desktop"

   mkdir -p "${pkgdir}"/usr/share/mime/packages
   install -Dm644 "${pkgdir}/opt/smoffice2012/mime/softmaker-office-2012.xml" "${pkgdir}/usr/share/mime/packages"
   # To set icons to generic style, uncomment the lines below
   #sed -i -r "/mime-type type=\"application\/x-(tmd|tmv)\"/a\ \ \ \ \ \ \ <generic-icon name=\"x-office-document\"\ \/>" "${pkgdir}/usr/share/mime/packages/softmaker-office-2012.xml"
   #sed -i -r "/mime-type type=\"application\/x-(pmd|pmv)\"/a\ \ \ \ \ \ \ <generic-icon name=\"x-office-spreadsheet\"\ \/>" "${pkgdir}/usr/share/mime/packages/softmaker-office-2012.xml"
   #sed -i -r "/mime-type type=\"application\/x-(prd|prv|prs|)\"/a\ \ \ \ \ \ \ <generic-icon name=\"x-office-presentation\"\ \/>" "${pkgdir}/usr/share/mime/packages/softmaker-office-2012.xml"
   # To use Softmaker-style icons, while you have set the alternative link names below, use the following lines instead
   #sed -i -r "/mime-type type=\"application\/x-(tmd|tmv)\"/a\ \ \ \ \ \ \ <generic-icon name=\"application-x-tmd12\"\ \/>" "${pkgdir}/usr/share/mime/packages/softmaker-office-2012.xml"
   #sed -i -r "/mime-type type=\"application\/x-(pmd|pmv)\"/a\ \ \ \ \ \ \ <generic-icon name=\"application-x-pmd12\"\ \/>" "${pkgdir}/usr/share/mime/packages/softmaker-office-2012.xml"
   #sed -i -r "/mime-type type=\"application\/x-(prd|prv|prs|)\"/a\ \ \ \ \ \ \ <generic-icon name=\"application-x-prd12\"\ \/>" "${pkgdir}/usr/share/mime/packages/softmaker-office-2012.xml"

   for size in 16 32 48
    do
      install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
      ln -s "/opt/smoffice2012/icons/pml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2012-planmaker.png"
      ln -s "/opt/smoffice2012/icons/prl_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2012-presentations.png"
      ln -s "/opt/smoffice2012/icons/tml_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/smoffice2012-textmaker.png"

      install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
      ln -s "/opt/smoffice2012/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd.png"
      ln -s "/opt/smoffice2012/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmv.png"
      ln -s "/opt/smoffice2012/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd.png"
      ln -s "/opt/smoffice2012/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prv.png"
      ln -s "/opt/smoffice2012/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prs.png"
      ln -s "/opt/smoffice2012/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd.png"
      ln -s "/opt/smoffice2012/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmv.png"
      # To avoid conflicting icon names (FreeOffice), comment the lines above, uncomment the lines below
      #ln -s "/opt/smoffice2012/icons/pmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-pmd12.png"
      #ln -s "/opt/smoffice2012/icons/prd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-prd12.png"
      #ln -s "/opt/smoffice2012/icons/tmd_${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-tmd12.png"
    done

   install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/softmaker-office-bin/license.txt"
}
