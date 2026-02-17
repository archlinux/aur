# Maintainer: BitYoungjae <bityoungjae@gmail.com>
pkgname=chalkak-ocr-models
pkgver=1
pkgrel=1
pkgdesc="PaddleOCR v5 model files for ChalKak OCR feature"
arch=('any')
url="https://github.com/bityoungjae/chalkak"
license=('Apache-2.0')
source=("$pkgname-v$pkgver.tar.gz::$url/releases/download/ocr-models-v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('279333931190e5b518d00f154762842a911b6aab3ac11c0173607eb82cc8ad74')

package() {
  local _models="$pkgdir/usr/share/chalkak/models"

  # Shared detection model
  install -Dm644 "PP-OCRv5_mobile_det.mnn" "$_models/PP-OCRv5_mobile_det.mnn"

  # Language-specific recognition models and charset files
  local _langs=(
    "korean:korean_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_korean.txt"
    "en:en_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_en.txt"
    "chinese:PP-OCRv5_mobile_rec.mnn:ppocr_keys_v5.txt"
    "latin:latin_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_latin.txt"
    "cyrillic:cyrillic_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_cyrillic.txt"
    "arabic:arabic_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_arabic.txt"
    "th:th_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_th.txt"
    "el:el_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_el.txt"
    "devanagari:devanagari_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_devanagari.txt"
    "ta:ta_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_ta.txt"
    "te:te_PP-OCRv5_mobile_rec_infer.mnn:ppocr_keys_te.txt"
  )

  for _entry in "${_langs[@]}"; do
    IFS=: read -r _ _rec _keys <<< "$_entry"
    install -Dm644 "$_rec" "$_models/$_rec"
    install -Dm644 "$_keys" "$_models/$_keys"
  done
}
