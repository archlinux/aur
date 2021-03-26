# Maintainer :  Kr1ss  < $(tr +- .@ <<<kr1ss+x-yandex+com) >
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>


pkgname=maltego

pkgver=4.2.16.13775
pkgrel=1

pkgdesc='Information gathering software by Paterva'
url="https://www.$pkgname.com"
arch=('any')
license=('custom')

depends=('java-runtime' 'sh')

install="$pkgname.install"
source=("https://$pkgname-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v$pkgver.deb"
        "LICENSE.pdf::https://www.$pkgname.com/pdf/legal/${pkgname^}%20Technologies_TermsandConditions_2020-11.pdf")
sha256sums=('57b29f731dc884651ac89d12574bdc26881973f7197199890d3b9f0c803fd4d0'
            '5295b55e0da0a7aaa733032bf6d508dd149d66b379f71c4b15271729c3aa5500')


package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  sed -i 's|\(Exec=\)x-www-browser|\1xdg-open|g;s|^\(Version=\).*|\11.0|' \
         "$pkgdir/usr/share/applications/$pkgname"{,_config}.desktop
  chmod g-w "$pkgdir"/usr{,/bin,/share{,/applications,"/$pkgname",/pixmaps}}
  install -Dm644 LICENSE.pdf -t"$pkgdir/usr/share/licenses/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
