# $Id: PKGBUILD 211456 2017-02-09 14:01:34Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=urbanterror
pkgver=4.3.2
pkgrel=3
epoch=1
pkgdesc="A team-based tactical shooter based on the Quake 3 Engine"
arch=('x86_64')
url="http://www.urbanterror.info"
license=('GPL2')
depends=('sdl' 'openal' 'curl')
backup=('opt/urbanterror/q3ut4/server.cfg' 'opt/urbanterror/q3ut4/mapcycle.txt')
makedepends=('mesa')
source=("http://www.happyurtday.com/releases/4x/UrbanTerror${pkgver//.}_full.zip"
        "https://github.com/Barbatos/ioq3-for-UrbanTerror-4/releases/download/release-4.3.2-hotfix/Quake3-UrT-Ded.x86_64"
        "https://github.com/Barbatos/ioq3-for-UrbanTerror-4/releases/download/release-4.3.2-hotfix/Quake3-UrT.x86_64"
        "urbanterror.sh"
        "urbanterror-server.sh"
        "urbanterror.desktop"
        "urbanterror.png")
sha512sums=('6611fd9c6309a95e479015764b082934f072a17394764491d8b025ab0eb977954807cc942ca5bd54bc9cfa512850e0f4d3994c94e91eb27eeffbde805a749d2a'
            'a1e599ba8daf5f36c6edc18700677f2c47f25c719b27a1895899800b9588c8b5fa2dbc8557939bb6a90d17468dc8b41a634bb76a7424dbb740c1527fdbb11c5a'
            'a29a9a0ac5625e243614289dda49512fed55b372d663ec582a7e69a8f0db5f12a3b00b9dd574b4e82bc6b7f2978bb96d644d8d5879fc53c7543052202bfd5aeb'
            'd296cee59c9a344b03485b2400278f05d4a4edd8f782f72b10857d4654d46ff1b6f181c51abb5a718d6b4a7227601d67fb2ba2b3fe7876bfec17b7c9827525a0'
            '6f444b1203b8c1a66c86a2112f3565059ba1135940cef37208ea05933290e1b3b9d8325c7fc86466fd8646338c8deaa168a22049104bda0631eab76a21a77e51'
            '33cb13820002f6620075143a1729018caf70a7cceb9b606db295fd621833add127474f1399626d722a3a8a7d9ba001b6dada4ca877ec87251a32d616367991d4'
            'aad7cf50335d7d1a1bcb03be0cf52f8e8214e91d7ff1c76045ffed57ba599023468341a3ae07abb8b06ef2857deeae8610defdd2dc8a3e5fb48eeb3ca2033074')

package() {
  install -d "${pkgdir}/opt/urbanterror"

  cd "${pkgdir}/opt/urbanterror"

  # Copy patched binaries.
  install -m755 "${srcdir}/Quake3-UrT.x86_64" urbanterror
  install -m755 "${srcdir}/Quake3-UrT-Ded.x86_64" urbanterror-ded

  # Copy data
  cp -r "${srcdir}/UrbanTerror43/q3ut4" "${pkgdir}/opt/urbanterror/q3ut4"  
  install -Dm644 "${srcdir}/UrbanTerror43/q3ut4/readme43.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo -e "\nseta cl_cURLLib \"/usr/lib/libcurl.so.4\"" >> "${pkgdir}/opt/urbanterror/q3ut4/autoexec.cfg"

  # Copy desktop launcher.
  install -Dm644 "${srcdir}/urbanterror.desktop" "${pkgdir}/usr/share/applications/urbanterror.desktop"
  install -Dm644 "${srcdir}/urbanterror.png" "${pkgdir}/usr/share/pixmaps/urbanterror.png"

  # Copy launch scripts.
  install -Dm755 "${srcdir}/urbanterror.sh" "${pkgdir}/usr/bin/urbanterror"
  install -Dm755 "${srcdir}/urbanterror-server.sh" "${pkgdir}/usr/bin/urbanterror-server"
}

# vim: sw=2:ts=2 et:
