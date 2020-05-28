# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <@zoho.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgbase=ttf-droid-family-ib
pkgname=('ttf-droid-ib' 'ttf-droid-nonlatin-ib')
pkgver=20121017
pkgrel=13
pkgdesc='General-purpose fonts released by Google as part of Android, plus monospaced variants'
arch=('any')
license=('Apache')
url='http://code.google.com/android/'
groups=('infinality-bundle-fonts')
source=("https://sources.archlinux.org/other/community/ttf-droid/ttf-droid-$pkgver.tar.xz"
        'http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip'
        'http://www.cosmix.org/software/files/DroidSansMonoDotted.zip'
        '45-droid.conf'
        '65-ttf-droid-sans.conf'
        '65-ttf-droid-serif.conf'
        '90-tt-droid.conf')
sha256sums=('f068efec9e8201fe0d1be75b1a4751c98d14dc44267b2237f549403b2a8069e3'
            '71768814dc4de0ea6248d09a2d2285bd47e9558f82945562eb78487c71348107'
            '43421e46a771a739177065025fc400db220465a3ca6fa51f27153c68787650e4'
            '67ea88143fe8602f85c3e944505104aacf140eb52d46317933306dca0e0a43cc'
            'cf97dd67780b65931dd5f10dabba961c9e11315c0e743177f8ad17269ca00769'
            '6256741621cb377b8d786e130fec11eb58bf245f486a0219bf9c7f15b4db805c'
            'ee7219ba1e75e71fe688fbb6941a40d27300d34776332b4561a0d020ec0e6c41')

package_ttf-droid-ib() {
  pkgdesc='General-purpose fonts released by Google as part of Android. Includes additional monospaced variants with dotted and slashed zeros.'
  conflicts=('ttf-droid' 'ttf-droid-monovar' 'ttf-droid-monovar-ib')
  provides=('ttf-font' 'ttf-droid' 'ttf-droid-monovar' 'ttf-droid-monovar-ib')
  cd "google-droid-fonts-$pkgver"
  install -Dm644 -t "$pkgdir"/usr/share/fonts/"$pkgname" \
    DroidSerif-Bold.ttf DroidSerif-BoldItalic.ttf DroidSerif-Italic.ttf \
    DroidSerif-Regular.ttf DroidSans-Bold.ttf DroidSans.ttf DroidSansMono.ttf
  pushd ..
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname/" \
    DroidSansMonoDotted.ttf DroidSansMonoSlashed.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.avail/" \
    45-droid.conf 65-ttf-droid-sans.conf 65-ttf-droid-serif.conf 90-tt-droid.conf
  install -d "$pkgdir/etc/fonts/conf.d/"
  pushd "$pkgdir/etc/fonts/conf.d/"
  ln -s ../conf.avail/*.conf ./
}

package_ttf-droid-nonlatin-ib() {
  pkgdesc='General-purpose fonts released by Google as part of Android. Non-Latin language support.'
  depends=('ttf-droid-ib')
  cd "google-droid-fonts-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" \
    DroidKufi-Bold.ttf DroidKufi-Regular.ttf DroidNaskh-Bold.ttf \
    DroidNaskh-Regular-SystemUI.ttf DroidNaskh-Regular.ttf DroidSansArabic.ttf \
    DroidSansArmenian.ttf DroidSansDevanagari-Regular.ttf \
    DroidSansEthiopic-Bold.ttf DroidSansEthiopic-Regular.ttf \
    DroidSansFallback.ttf DroidSansFallbackFull.ttf \
    DroidSansFallbackLegacy.ttf DroidSansGeorgian.ttf \
    DroidSansHebrew-Bold.ttf DroidSansHebrew-Regular.ttf DroidSansJapanese.ttf \
    DroidSansTamil-Bold.ttf DroidSansTamil-Regular.ttf DroidSansThai.ttf
}
