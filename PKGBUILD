# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=flite-voices
pkgver=2.3
pkgrel=1
pkgdesc="Voices for the flite lightweight speech synthesis engine"
arch=(any)
url="http://cmuflite.org"
license=(custom)
depends=(bash flite)
source=(http://festvox.org/flite/packed/flite-$pkgver/voices/cmu_us_{aew,ahw,aup,awb,axb,bdl,clb,eey,fem,gka,jmk,ksp,ljm,lnh,rms,rxr,slp,slt}.flitevox)

prepare() {
  mkdir $pkgname
}
build() {
  cd $pkgname
  for v in aew ahw aup awb axb bdl clb eey fem gka jmk ksp ljm lnh rms rxr slp; do
    echo -e "#!/bin/sh\nexec flite -voice /usr/lib/flite/cmu_us_${v}.flitevox \"\$@\"" >flite_cmu_us_${v}
  done
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib/flite"
  for v in aew ahw aup awb axb bdl clb eey fem gka jmk ksp ljm lnh rms rxr slp; do
    install -m0755 flite_cmu_us_${v} "$pkgdir/usr/bin"
    install -m0644 ../cmu_us_${v}.flitevox "$pkgdir/usr/lib/flite"
  done
  install -m0644 ../cmu_us_slt.flitevox "$pkgdir/usr/lib/flite"
}

sha256sums=('5fd165e5ea219236e9c20e338efb140163380472f22d60c7a1f79b4997cad50c'
            '8bab5975c40ea64fbbc324c20ced3587e02aaa30aba6fa2631af4e2fb8e6f3f5'
            'c464ce87d33fe9718d96909ecf11ebd6267c47fbca97a041fbf17356504c6cc1'
            '5f9d6ff1d333f30a1ed357574e63b5c8bb2b42b56ebf988570ac020a467ef82a'
            '6d96bbf4e8ec686ee57d8cf6311ae6269d73c0a9e4fe52180468cfa1892b17ce'
            'e274b108ae41120566290ba8beb4a5141abdc9c1ae1e446c5ab2981ef4683551'
            '709bd0e8acac4374e8beb704da7e31cd254385a4c73bafb6e3390a6d1281e885'
            '875a9a6f7f3a746549138d5817bb49419ac1290a7023b014114f88bc68f0cab9'
            '8043ccd6e83cc6679e386eb888f5ed4faac664f06149aecf9529e45b3f91bc88'
            'e8a9fcb10a2a0b6d78022131277bf546fd0e650ebce03108bc4440d4d2367a65'
            'deb85a2d90cd8aef2104431cccf096cdba6485c5b83a85330a948657ae6eb5d5'
            '53927cdb7eb3f83d8db2faa79fdb8115c82e96ca71c4b095eb05c67667d36a02'
            '90b1c8b507912db357084e33ba8f83f015ae0268bb59fdd0a6298d1110fe23d2'
            'd3fb6b1c4f781fc5c9b1ea5efdc8c46c1ce5e74cf349cd78c1fae3c0e19d7c9f'
            'cf49e138caa926c2551079efe561254eb3bb50340139484d3aa20670b5cb0c55'
            'e7007354436387f721cdce03f89388507e9ca9f8a76f36c288fc950ea6b56e25'
            'd5022f507d513b3dd78705f8e747015a4c933fdbd872f1c3057a5a9915b145d3'
            'c54b0d757b943bfbffc626e95a251f1659cc2d840465daa8b858457139b94bc0')
