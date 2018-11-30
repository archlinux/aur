# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: N. Izumi izmntuk google email

set -u
pkgname='symantec-ghost'
pkgver='11.5'
pkgrel='2'
pkgdesc='Symantec Ghost for Linux'
arch=('i686' 'x86_64')
url='http://www.symantec.com/ghost-solution-suite'
license=('custom')
depends_x86_64=('lib32-gcc-libs' 'lib32-libx11')
depends_i686=('gcc-libs' 'libx11')
optdepends=('polkit: to run ghost directly from menu')
makedepends=('glibc')
options=('!strip')
source=(
  'ghost.desktop'
  'ghost.polkit'
  'http://upload.wikimedia.org/wikipedia/en/5/58/Norton_Ghost_icon.png'
  'ftp://ftp.norton.com/public/english_us_canada/products/symantec_ghost_solution_suite/2.5/manuals/readme.txt'
  'ftp://ftp.norton.com/public/english_us_canada/products/symantec_ghost_solution_suite/2.5/updates/GSSB2174.zip'
)
#source[4]="${source[4]##*/}"

sha256sums=('7d0b4a0f3c15927d8b9c788f61ea05d6dd591fea0db99e8cb5cacaba5dab218c'
            '852c2208a95080923e7534146e86d0b50ff790a254161fad900029c7e44181e3'
            '849459ed3ff52e76547eb1f90d2963226a4bd9d9875473785cbf3922ab3ca0ac'
            '39b5bca2401df511364904039fb8f692be3095f57df434245cfc36893416b176'
            'a477be351ba22d7f11bbeebfa2a40cad81d394e6c0c95657e3e4d2705876b228')

prepare() {
  set -u
  iconv -f 'cp1251' -t 'utf8' 'readme.txt' -o 'README.txt'
  cp --attributes-only --preserve='timestamps' 'readme.txt' 'README.txt'
  set +u
}

package() {
  set -u
  install -Dpm744 'ghost' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'Norton_Ghost_icon.png' "${pkgdir}/usr/share/icons/ghost.png"
  install -Dpm644 'ghost.desktop' -t "${pkgdir}/usr/share/application/"
  install -Dpm644 'ghost.polkit' "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.ghost.policy"
  install -Dpm644 'README.txt' "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/README" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  set +u
}
set +u
