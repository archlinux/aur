# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: N. Izumi izmntuk google email

pkgname='symantec-ghost'
pkgver='11.5'
pkgrel='2'
pkgdesc='Symantec Ghost for Linux'
arch=('i686' 'x86_64')
url='http://www.symantec.com/ghost-solution-suite'
license=('custom')
options=('!strip')
depends=('lib32-gcc-libs' 'lib32-libx11')
[[ "${CARCH}" == i686 ]] && depends=("${depends[@]/lib32-/}")
optdepends=('polkit: to run ghost directly from menu')
makedepends=('glibc')
source=('ghost.desktop'
  'http://upload.wikimedia.org/wikipedia/en/5/58/Norton_Ghost_icon.png'
  'ghost.polkit'
  'ftp://ftp.norton.com/public/english_us_canada/products/symantec_ghost_solution_suite/2.5/manuals/readme.txt'
  'ghost'
)

sha256sums=('7d0b4a0f3c15927d8b9c788f61ea05d6dd591fea0db99e8cb5cacaba5dab218c'
            '849459ed3ff52e76547eb1f90d2963226a4bd9d9875473785cbf3922ab3ca0ac'
            '852c2208a95080923e7534146e86d0b50ff790a254161fad900029c7e44181e3'
            '39b5bca2401df511364904039fb8f692be3095f57df434245cfc36893416b176'
            '511cbfd3b362b02c5b5f2f0bdde1108bc44001bfa60ee6c5c3f48f80f4256d51')

if ! :; then
  ## fetch&extract the binary('ghost') from this file if you have a license of GSS2.5:
  source[4]='ftp://ftp.norton.com/public/english_us_canada/products/symantec_ghost_solution_suite/2.5/updates/GSSB2174.zip'
  sha256sums[4]='a477be351ba22d7f11bbeebfa2a40cad81d394e6c0c95657e3e4d2705876b228'
else
  sha256sums[4]='511cbfd3b362b02c5b5f2f0bdde1108bc44001bfa60ee6c5c3f48f80f4256d51'
fi

prepare() {
  iconv -f cp1251 -t utf8 'readme.txt' -o 'README.txt'
  cp --attributes-only --preserve=timestamps 'readme.txt' 'README.txt'
}

package() {
  install -pDm744 'ghost' "${pkgdir}/usr/bin/ghost"
  install -pDm644 'Norton_Ghost_icon.png' "${pkgdir}/usr/share/icons/ghost.png"
  install -pDm644 'ghost.desktop' "${pkgdir}/usr/share/applications/ghost.desktop"
  install -pDm644 'ghost.polkit' "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.ghost.policy"
  install -pDm644 'README.txt' "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -rs "${pkgdir}/usr/share/doc/${pkgname}/README" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
