# Maintainer: desbma
pkgname=abchr
pkgver=0.5b
pkgrel=2
pkgdesc="Tool to do ABC/HR or ABX blind tests on audio files"
arch=('any')
url="http://www.rarewares.org/others.php#java-abc-hr"
license=('LGPL')
depends=('bash' 'java-runtime>=6')
optdepends=('faad2: AAC (MP4, M4A) decoding support'
            'flac: FLAC decoding support'
            'lame: MP3 decoding support'
            'mac: Monkeys Audio (APE) decoding support'
            'musepack-tools: Musepack (MPC) decoding support'
            'opus-tools: Opus decoding support'
            'vorbis-tools: Vorbis (OGG) decoding support'
            'wavpack: WavPack (WV) decoding support')

source=(http://www.rarewares.org/files/others/$pkgname-java-$pkgver.zip
        'abchr'
        'clicodecs.cfg.patch')
sha512sums=('322b3ba473dd39ed3c75a82d932ba67f8d651492e7a2adb2ea8d106372e79ac4b002452e06da56fa36ebfd5282d7bd2986d8f5bf079695bbfb2992011aaea889'
            '4bfe670dee0f44bf137599f99b3238f6dee16bc4e9edb47dff75d88f9dd2a005809a48dbe6a8228cb87d750b5e15dd2447e4d200b1ce113d62265303795ec9bf'
            'b1ec7600fc23ebb54ef2aec20065bde9c6ff66a70d1dabdb04c56e2cba6fae5cce0cf451d9cd37bcccc9212a60766424b0e8a21b9fe25d998033aacde771afb3')

prepare() {
    cd "abchr-java"
    patch -i "${srcdir}/clicodecs.cfg.patch" clicodecs.cfg
}

package() {
    cd "abchr-java"
    install -Dm 644 -t "${pkgdir}/usr/share/java/$pkgname" *.jar
    install -Dm 644 -t "${pkgdir}/usr/share/$pkgname" clicodecs.cfg

    cd "${srcdir}"
    install -Dm 755 -t "${pkgdir}/usr/bin" abchr
}
