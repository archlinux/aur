# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor:

pkgname=progit2
pkgver=2.0.0.1084
pkgrel=1
pkgdesc="The offline version of the entire Pro Git book, written by Scott Chacon and Ben Straub"
arch=('any')

url="https://git-scm.com/book/en/v2"
license=('CCPL:by-nc-sa')

makedepends=(
  'unzip'
)

install=${pkgname}.install

source=(
    "https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.${pkgver##*.}.epub"
    "https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.${pkgver##*.}.mobi"
    "https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.${pkgver##*.}.pdf"
    "https://progit2.s3.amazonaws.com/en/2016-03-22-f3531/progit-en.${pkgver##*.}.zip"
)
noextract=(
    "progit-en.${pkgver##*.}.zip"
)
sha512sums=(
    8d5a0edd69949850643036d92e1e86d4745ea537b314242cbab805fd2f7501c65d280d3c65eb2241124d93c280643b46eacd97f28cc67f2958fb106e15070cfd
    48c1a0884806f401c49ea007684af2ddecab2a8353216f05659b0c4dee360a4474b67f9d2eeec62f42ba40bfa7a1fe2a5494ba98e8611f9e7b74e8611057509c
    9285c44b518fe0551a6442f02c72e43ab6a2ce427f87e9f3fa0d5666c458a686857f031de60d79c627eabffe529c4212d81683ec6ac120781d071f7f2276d82e
    93ebb908f8ad074c56a4c5276bea6da77a6bfac7ba00662bf93c43e504198436257c6cd22b58705cb64ebe228100dfd692be5b0c1d2df334d442af7cc514b452
)

prepare() {
    unzip -d html "progit-en.${pkgver##*.}.zip"
    sed -i 's/src=\"book\/cover.png\"/src=\"html\/book\/cover.png\"/' html/cover.html
    sed -i 's/href=\"LICENSE.html\"/href=\"html\/LICENSE.html\"/' html/cover.html
    mv html/cover.html progit.html
}

package() {
    # When entering here, we are in the src directory. Not need to check with
    # an || exit statement, since every error occuring in PKGBUILD or .install
    # files are detected and considered as errors by pacman, which then stops
    # automatically.

    # Install to /usr/share/doc/progit2
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
    cp "$srcdir/progit-en.${pkgver##*.}.epub" "$pkgdir/usr/share/doc/$pkgname/progit.epub"
    cp "$srcdir/progit-en.${pkgver##*.}.mobi" "$pkgdir/usr/share/doc/$pkgname/progit.mobi"
    cp "$srcdir/progit-en.${pkgver##*.}.pdf" "$pkgdir/usr/share/doc/$pkgname/progit.pdf"
    cp "$srcdir/progit.html" "$pkgdir/usr/share/doc/$pkgname/"
    cp -a "$srcdir/html" "$pkgdir/usr/share/doc/$pkgname/"
}
