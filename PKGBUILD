# Maintainer:
# Contributor: Courtney Swagar <distorto@member.fsf.org>

: ${_commit:=df645349406c0d06562040d3a5268d60dc34ec56}

_fontname="merriweather-sans"
_pkgname="ttf-$_fontname"
pkgbase="$_pkgname"
pkgver=2.001
pkgrel=1
pkgdesc='A sans-serif typeface that is pleasant to read on screens by Sorkin Type Co'
url='https://github.com/SorkinType/Merriweather-Sans'
license=(' OFL-1.1-RFN')
arch=('any')

source=(
  "MerriweatherSans-Bold-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-Bold.ttf"
  "MerriweatherSans-BoldItalic-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-BoldItalic.ttf"
  "MerriweatherSans-ExtraBold-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-ExtraBold.ttf"
  "MerriweatherSans-ExtraBoldItalic-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-ExtraBoldItalic.ttf"
  "MerriweatherSans-Italic-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-Italic.ttf"
  "MerriweatherSans-Light-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-Light.ttf"
  "MerriweatherSans-LightItalic-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-LightItalic.ttf"
  "MerriweatherSans-Regular-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/ttf/MerriweatherSans-Regular.ttf"
  "MerriweatherSans-Italic[wght]-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/variable/MerriweatherSans-Italic%5Bwght%5D.ttf"
  "MerriweatherSans[wght]-$pkgver-${_commit::7}.ttf"::"https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/fonts/variable/MerriweatherSans%5Bwght%5D.ttf"
  "$_fontname-$pkgver-${_commit::7}-LICENSE.txt::https://github.com/SorkinType/Merriweather-Sans/raw/${_commit}/OFL.txt"
)
sha256sums=(
  '94ac9ad8fc7decbf9108b2fd532dafc34747c3fb0a43adc96d0182ff9242b2be'
  'cb77e6a773760f24c84e8388eb0226fe4b58af4e1d91bc402e1087e64038415c'
  '802d9e5ca2e1c303c1fc714a2afa9cb74a03c4a597b9ccfa55bfda7c66ea71dc'
  '62f7bf52108c7a1b47f752e7ae854bd3eb8c45434156e9dc04ac8f07b81703aa'
  '977d0588a2da17b6a773b8f34492ef0b368e32350463b8ac8bb15741ca17e072'
  '4a98b25518da3063c5063730e43248068067b685aa38a2e547f614570fccfab7'
  '09db95d3a8c72299b2093930fe6820f0d7f75ece9fa802fa744adaa2e4a995a0'
  'aef68ceec429f644df7e35e57667a5f37df42d231210ecc456ef4abe4b1e3595'
  '882e6763fa1f35dc03cd61c1e3186dba2408828c807895dfa16875b1242ad59d'
  'bef90d227eeb5b58e27d0a421df6c5d8df2e6a6d68aa08bdc51faa54f1d997dc'
  'c487138e4ea4688386abfaf72ab2cbc72a7c8c358cca19bd70095e0d07d8d9f2'
)

_package_merriweather-sans() {
  local _f _fonts=(
    MerriweatherSans-Bold
    MerriweatherSans-BoldItalic
    MerriweatherSans-ExtraBold
    MerriweatherSans-ExtraBoldItalic
    MerriweatherSans-Italic
    MerriweatherSans-Light
    MerriweatherSans-LightItalic
    MerriweatherSans-Regular
  )

  for _f in "${_fonts[@]}"; do
    install -Dm644 "$_f-$pkgver-${_commit::7}.ttf" "$pkgdir/usr/share/fonts/$_pkgname/$_f.ttf"
  done

  install -Dm644 "$_fontname-$pkgver-${_commit::7}-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_package_merriweather-sans-variable() {
  local _f _fonts=(
    "MerriweatherSans-Italic[wght]"
    "MerriweatherSans[wght]"
  )

  for _f in "${_fonts[@]}"; do
    install -Dm644 "$_f-$pkgver-${_commit::7}.ttf" "$pkgdir/usr/share/fonts/$_pkgname/$_f.ttf"
  done

  install -Dm644 "$_fontname-$pkgver-${_commit::7}-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=(
  "ttf-$_fontname"
  "ttf-$_fontname-variable"
)

for i in "${pkgname[@]}"; do
  eval "package_${i} ()
    $(declare -f _package_${i#ttf-} | tail -n +2)"
done
