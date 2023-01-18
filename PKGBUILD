# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=viewmailattachments
pkgver=r7.c0e5a9e
_git_SHA=c0e5a9e0bf22591b49ba63bf548b442df651665d
pkgrel=1
pkgdesc='Show HTML messages in an external browser, including embedded images'
url='https://github.com/akkana/scripts'
arch=('any')
license=('GPL2')
depends=('python')

source=(${pkgname}.py-${pkgver}::"https://raw.githubusercontent.com/akkana/scripts/${_git_SHA}/${pkgname}.py"
        ${pkgname}_no_private_tab_firefox.patch)
sha256sums=('df3b0163b5d008cbdd2eadf31b5aace66251ce624f20c95c3220f5b2897b6873'
            'f288921c859db46a9b0ccb31bb7cc802f60f901b6f2f15e9eeb06fb8c6c85844')

prepare() {
  # remove .py suffix from the comments. Script will be installed without this suffix.
  sed "s/viewhtmlmail.py/${pkgname}/g" ${pkgname}.py-${pkgver} > ${pkgname}-${pkgver}
  # use this version once upstream accepts pull request https://github.com/akkana/scripts/pull/25/files
  # sed "s/${pkgname}.py/${pkgname}/g" ${pkgname}.py-${pkgver} > ${pkgname}-${pkgver}

  # disable private tabs in Firefox
pwd
  patch ${pkgname}-${pkgver} <"$srcdir/${pkgname}_no_private_tab_firefox.patch"
}

package() {
  install -Dm755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/${pkgname}"
}
